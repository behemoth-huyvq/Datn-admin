import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getStudentsList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('students.json', {
      params,
      paramsSerializer
    });
  },
  destroyStudent(studentId) {
    if (!studentId) return;

    return Axios.delete(`/students/${studentId}`, {});
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