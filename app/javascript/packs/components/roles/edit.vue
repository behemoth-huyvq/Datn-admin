<template>
  <div>
    <Form :role="role" :is-create="false" />
    <button class="btn btn-info" @click="onIndexRole()">Trở về danh sách</button>
  </div>
</template>
<script>
import Form from "./Form";

export default {
  components: {
    Form,
  },
  props: {
    role: {
      type: Object,
      required: true
    }
  },
  data: function() {
    return {
    };
  },
  methods: {
    onIndexRole: function() {
      window.location.replace("/roles");
    }
  }
};
</script>