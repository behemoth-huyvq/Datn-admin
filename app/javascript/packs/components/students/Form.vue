<template>
  <div>
    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Mã sinh viên</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingStudent.student_code"
          class="form-control"
          readonly
        />
        <div class="validation" v-if="errors.student_code">
          <p v-for="(error, key) in errors.student_code" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Tên sinh viên</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingStudent.name"
          class="form-control"
        />
        <div class="validation" v-if="errors.name">
          <p v-for="(error, key) in errors.name" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Loại môn học</label>
      <div class="col-sm-10">
        <date-picker v-model="creatingStudent.dob" valueType="format"></date-picker>
        <div class="validation" v-if="errors.dob">
          <p v-for="(error, key) in errors.dob" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Lớp học</label>
      <div class="col-sm-10">
        <select v-model="creatingStudent.class_name" class="form-control">
          <option v-bind:value="null">--Vui lòng chọn--</option>
          <option v-for="(className, index) in classNameOption"
                  v-bind:value="className"
                  :key="index">
            {{ className }}</option>
        </select>
        <div class="validation" v-if="errors.class_name">
          <p v-for="(error, key) in errors.class_name" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Chương trình học</label>
      <div class="col-sm-10">
        <select v-model="creatingStudent.program" class="form-control">
          <option v-bind:value="null">--Vui lòng chọn--</option>
          <option v-for="(program, index) in programOption"
                  v-bind:value="program"
                  :key="index">
            {{ program }}</option>
        </select>
        <div class="validation" v-if="errors.program">
          <p v-for="(error, key) in errors.program" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <button
      class="btn btn-primary float-right"
      @click.prevent="save(creatingStudent)"
    >
      Lưu lại
    </button>
  </div>
</template>
<script>
import StudentApi from "../../../api/students";
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';

export default {
  components: {
    StudentApi,
    DatePicker
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
    },
    isCreate: Boolean
  },
  data: function() {
    return {
      creatingStudent: this.student,
      errors: {},
    };
  },
  methods: {
    save: async function() {
      let self = this;

      try {
        const response = this.isCreate
          ? await StudentApi.createStudent(this.creatingStudent)
          : await StudentApi.editStudent(this.creatingStudent);

        await this.$swal.fire({
          icon: "success",
          title: "Sinh viên đã được lưu.",
          showConfirmButton: false,
          timer: 1500
        });

        this.onIndexStudent();
      } catch (e) {
        console.log(e)
        await this.$swal.fire({
          icon: "error",
          title: "Một lỗi đã xảy ra. Vui lòng kiểm tra.",
          showConfirmButton: false,
          timer: 1500
        });

        this.errors = e.response.data;
      }
    },
    onIndexStudent: function() {
      window.location.replace("/students");
    }
  }
};
</script>
<style scoped lang="scss">
.article-image {
  width: 500px;
}
.height-editor {
  height: 420px;
}
.height-row-editor {
  height: 304px;
}
</style>
