import express from "express";

const router = express.Router();
const { APP_NAME, APP_VERSION } = process.env;
const sticky = (Math.random() + 1).toString(36).substring(10);

router.get("/healthcheck", (_, res) => {
  res.send({
    app: APP_NAME || "Dockerlabs api",
    version: APP_VERSION || "1.x.x",
    sticky
  });
});

router.get("/500", (_, res) => {
  res.status(500).send("⛈️ Internal Server Error ⛈️");
});

export default router;
