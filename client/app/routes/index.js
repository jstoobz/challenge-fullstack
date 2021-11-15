import Route from '@ember/routing/route'
import { inject as service } from '@ember/service'

export default class IndexRoute extends Route {
  @service
  apolloService

  beforeModel() {}

  async model(params) {
    const events = await this.apolloService.fetchAllEvents()
    const bookings = await this.apolloService.fetchAllBookings()

    // Bookings returned just need to utilize

    // console.log(`events: ${JSON.stringify(events)}`)
    // console.log(`bookings: ${JSON.stringify(bookings)}`)

    const eventsGroupedByDay = (events) => {
      return events.reduce((acc, el) => {
        const [date, time_ms] = el.start.split('T')
        const time = time_ms.split(/(.+):/)[1]

        const formattedEvent = Object.assign({}, el, {
          start: time,
        })

        Object.keys(acc).includes(date)
          ? acc[date].push(formattedEvent)
          : (acc[date] = [formattedEvent])
        return acc
      }, {})
    }

    return eventsGroupedByDay(events)
  }
}
