import Axios from '../packs/axios.js'
import qs from 'qs'

export default {
  getRolesList(params = {}, format = 'json') {
    const paramsSerializer = params => qs.stringify(params, { arrayFormat: "brackets" });

    return Axios.get('roles.json', {
      params,
      paramsSerializer
    });
  },
  destroyRole(roleId) {
    if (!roleId) return;

    return Axios.delete(`/roles/${roleId}`, {});
  },
  createRole(role) {
    return Axios.post(`/roles`, {
      role: role
    });
  },
  editRole(role) {
    return Axios.put(`/roles/${role.id}`, {
      role: role
    });
  }
}