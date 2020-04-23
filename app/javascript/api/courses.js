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
  createCourse(course) {
    return Axios.post(`/courses`, {
      course: course
    });
  },
  editCourse(course) {
    return Axios.put(`/courses/${course.id}`, {
      course: course
    });
  }
}