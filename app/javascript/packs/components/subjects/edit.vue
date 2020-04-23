<template>
  <div>
    <Form :subject="subject"
          :subject-type-option="subjectTypeOption"
          :department-option="departmentOption"
          :is-create="false" />
    <button class="btn btn-info" @click="onIndexSubject()">Trở về danh sách</button>
  </div>
</template>
<script>
import Form from "./Form";

export default {
  components: {
    Form,
  },
  props: {
    subject: {
      type: Object,
      required: true
    },
    subjectTypeOption: {
      type: Array
    },
    departmentOption: {
      type: Array
    }
  },
  data: function() {
    return {
    };
  },
  methods: {
    onIndexSubject: function() {
      window.location.replace("/subjects");
    }
  }
};
</script>