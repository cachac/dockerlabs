export default async function (req, res, next) {
  console.log('🐋')
  const os = require('node:os')
  console.log('containerID :>> ', os.hostname())
  req.containerID = os.hostname()

  next()
}
