import Ember from 'ember'
import createBookingMutation from 'peek-client/gql/mutations/createBooking.graphql'

export default Ember.Component.extend({
  actions: {
    createBooking(eventId) {
      const firstName = this.get('firstName')
      const lastName = this.get('lastName')

      return this.get('apollo')
        .mutate(
          {
            mutation: createBookingMutation,
            variables: { eventId, firstName, lastName },
          },
          'createBooking'
        )
        .then(() => {
          this.set('firstName', '')
          this.set('lastName', '')
        })
        .catch((error) => alert(JSON.stringify(error)))
    },
  },

  apollo: Ember.inject.service(),
})
