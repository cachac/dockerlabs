import { getContainerIdSync } from 'docker-id'

const id = getContainerIdSync()
const isDocker = Boolean(id)
console.log('isDocker :>> ', isDocker)

export default ({ app }, inject) => {
  inject('container', {
    id,
  })
}
