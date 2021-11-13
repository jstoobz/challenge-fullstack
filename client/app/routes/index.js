import Route from '@ember/routing/route'
import { inject as service } from '@ember/service'

export default class IndexRoute extends Route {
  @service
  apolloService

  beforeModel() {}

  async model(params) {
    const model = await this.apolloService.fetchAllEvents()
    return model
  }
}
