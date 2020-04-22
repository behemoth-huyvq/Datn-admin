import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getSubjectsList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('subjects.json', {
      params,
      paramsSerializer
    });
  },
  destroySubject(subjectId) {
    if (!subjectId) return;

    return Axios.delete(`/subjects/${subjectId}`, {});
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