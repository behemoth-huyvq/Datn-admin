<template>
  <div>
    <Form :schedule="schedule"
          :course-code-option="courseCodeOption"
          :is-create="false" />
    <button class="btn btn-info" @click="onIndexSchedule()">Trở về danh sách</button>
  </div>
</template>
<script>
import Form from "./Form";

export default {
  components: {
    Form,
  },
  props: {
    schedule: {
      type: Object,
      required: true
    },
    courseCodeOption: {
      type: Array
    }
  },
  data: function() {
    return {
    };
  },
  methods: {
    onIndexSchedule: function() {
      window.location.replace("/schedules");
    }
  }
};
</script>