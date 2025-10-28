import winston, { format } from "winston";
import { sticky } from "./sticky.js";

const { combine, timestamp, label, metadata, printf } = format;

const options = {
  info: {
    level: "debug",
    filename: "logs/app.log",
    handleExceptions: true,
    maxSize: 10000000,
    maxFiles: 5,
  },
  error: {
    level: "error",
    filename: "logs/error.log",
    handleExceptions: true,
    maxSize: 50000000,
    maxFiles: 10,
  },
};

const logFormat = printf(({ level, message, timestamp, label, metadata }) => {
  return `${timestamp} [${label}] ${level}: ${message}. ${
    metadata && Object.keys(metadata).length
      ? `\n metadata: ${JSON.stringify(metadata, null, 2)}`
      : ""
  }`;
});

export const logger = winston.createLogger({
  level: "debug",
  format: combine(
    label({ label: `dockerlabs-api-${sticky}` }),
    timestamp({ format: "YYY-MM-DD HHmm:ss" }),
    metadata({ fillExcept: ["message", "level", "timestamp", "label"] }),
    logFormat
  ),
  // defaultMeta: { app: "dockerlabs-api", sticky },
  transports: [
    new winston.transports.File(options.error),
    new winston.transports.File(options.info),
    new winston.transports.Console(),
  ],
  exitOnError: false,
});
