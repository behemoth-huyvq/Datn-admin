import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getSchedulesList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('schedules.json', {
      params,
      paramsSerializer
    });
  },
  destroySchedule(schduleId) {
    if (!schduleId) return;

    return Axios.delete(`/schedules/${schduleId}`, {});
  },
  // createRole(role) {
  //   return Axios.post(`/roles`, {
  //     role: role
  //   });
  // },
  // editRole(role) {
  //   return Axios.put(`/roles/${role.id}`, {
  //     role: role
  //   });
  // }
}