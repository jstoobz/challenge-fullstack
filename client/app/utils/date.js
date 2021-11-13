/**
 * String date to browser local date
 * @param {*} d
 */
export const convertUTCDateToLocalDate = (d) => {
  const date = new Date(d)
  return new Date(date.getTime() - date.getTimezoneOffset() * 60 * 1000)
}
