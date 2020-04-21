<template>
  <div>
    <Form :user="user" :is-create="true" :role-options="roleOptions" :user-roles-attributes="userRolesAttributes"/>
    <button class="btn btn-info" @click="onIndexUser()">Trở về danh sách</button>
  </div>
</template>
<script>
import Form from "./Form";

export default {
  components: {
    Form
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    roleOptions: {
      type: Array,
      required: true
    },
    userRolesAttributes: {
      type: Array,
      required: true
    }
  },
  data: function() {
    return {};
  },
  methods: {
    onIndexUser: function() {
      window.location.replace("/users");
    }
  }
};
</script>