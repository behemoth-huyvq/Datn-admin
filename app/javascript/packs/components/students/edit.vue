<template>
  <div>
    <Form :student="student"
          :is-create="false"
          :class-name-option="classNameOption"
          :program-option="programOption"/>
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
    student: {
      type: Object,
      required: true
    },
    classNameOption: {
      type: Array
    },
    programOption: {
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