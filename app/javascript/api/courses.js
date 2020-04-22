import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getCoursesList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('courses.json', {
      params,
      paramsSerializer
    });
  },
  destroyCourse(courseId) {
    if (!courseId) return;

    return Axios.delete(`/courses/${courseId}`, {});
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