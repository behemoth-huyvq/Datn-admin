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
  createStudent(student) {
    return Axios.post(`/students`, {
      student: student
    });
  },
  editStudent(student) {
    return Axios.put(`/students/${student.id}`, {
      student: student
    });
  }
}