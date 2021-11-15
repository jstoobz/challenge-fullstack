import Service from '@ember/service'
import { queryManager } from 'ember-apollo-client'
import eventsQuery from 'peek-client/gql/queries/events.graphql'
import bookingsQuery from 'peek-client/gql/queries/bookings.graphql'
import createBookingMutation from 'peek-client/gql/mutations/createBooking.graphql'

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
    return await this.apollo.query({ query: eventsQuery }, 'events')
  }

  async fetchAllBookings() {
    return await this.apollo.query({ query: bookingsQuery }, 'bookings')
  }

  async createBooking(eventId) {
    const firstName = this.get('firstName')
    const lastName = this.get('lastName')

    return await this.apollo.query(
      {
        query: createBookingMutation,
        variables: { eventId, firstName, lastName },
      },
      'createBooking'
    )
  }
}
