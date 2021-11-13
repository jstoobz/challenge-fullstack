import Service from '@ember/service'
import { queryManager } from 'ember-apollo-client'
import query from 'peek-client/gql/queries/events.graphql'

/**
 * Emberjs planner service
 */
export default class ApolloService extends Service {
  @queryManager
  apollo

  /**
   * Build an error status with proper message.
   * @param {*} e
   */
  returnErrorStatus(e) {
    const message = e.errors.map((item) => item.message).join(',')
    return { status: 'error', message }
  }

  /**
   * Fetch all data with our main query
   */
  async fetchAllEvents() {
    return await this.apollo.query({ query }, 'events')
  }
}
