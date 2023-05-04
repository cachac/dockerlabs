import express from "express";
import helmet from "helmet";
import cors from "cors";
import compression from "compression";
import routes from "./routes/index.js";
import { errorHandler } from "./middleware/errorHandler.js";
import { logger } from "./utils/log.js";

const app = express();

// Middlewares
app.use(express.json());
app.use(cors());
app.use(compression());
app.use(helmet());
app.use(routes);
app.use(errorHandler);

process.on("uncaughtException", (err) => {
  logger.error("uncaughtException :", err);
  process.exit(1);
});

process.on("unhandledRejection", (err) => {
  logger.error("unhandledRejection :", err);
  process.exit(1);
});

const NODE_PORT = 3000;

app.listen(NODE_PORT, () => {
  logger.info(`Listening on port ${NODE_PORT}`);
});

// function call() {}
// const listen = (name, callback) => {
//   console.log("name: ", name);

//   return callback(`hello ${name}`);
// };

// listen("Carlos", (arg) => {
//   console.log("response", arg);
// });
