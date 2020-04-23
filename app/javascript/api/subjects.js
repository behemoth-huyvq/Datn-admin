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
  createSubject(subject) {
    return Axios.post(`/subjects`, {
      subject: subject
    });
  },
  editSubject(subject) {
    return Axios.put(`/subjects/${subject.id}`, {
      subject: subject
    });
  }
}