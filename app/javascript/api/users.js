import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getUsersList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('users.json', {
      params,
      paramsSerializer
    });
  },
  destroyUser(userId) {
    if (!userId) return;

    return Axios.delete(`/users/${userId}`, {});
  },
  createUser(user) {
    return Axios.post(`/users`, {
      user: user
    });
  },
  editUser(user) {
    return Axios.put(`/users/${user.id}`, {
      user: user
    });
  }
}