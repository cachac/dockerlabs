import winston from "winston";
import { sticky } from "./sticky.js";

export const logger = winston.createLogger({
  level: "debug",
  format: winston.format.json(),
  defaultMeta: { app: "dockerlabs-api", sticky },
  transports: [
    new winston.transports.File({ filename: "error.log", level: "error" }),
    new winston.transports.File({ filename: "combined.log" }),
    new winston.transports.Console({ format: winston.format.simple() }),
  ],
});
