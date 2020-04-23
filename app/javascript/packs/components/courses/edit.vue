<template>
  <div>
    <Form :course="course"
          :status-option="statusOption"
          :subject-name-option="subjectNameOption"
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
    course: {
      type: Object,
      required: true
    },
    statusOption: {
      type: Array
    },
    subjectNameOption: {
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