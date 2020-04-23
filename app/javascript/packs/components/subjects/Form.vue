<template>
  <div>
    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Mã môn học</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingSubject.subject_code"
          class="form-control"
          readonly
        />
        <div class="validation" v-if="errors.subject_code">
          <p v-for="(error, key) in errors.subject_code" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Tên môn học</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingSubject.subject_name"
          class="form-control"
        />
        <div class="validation" v-if="errors.subject_name">
          <p v-for="(error, key) in errors.subject_name" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Loại môn học</label>
      <div class="col-sm-10">
        <select v-model="creatingSubject.subject_type" class="form-control">
          <option v-bind:value="null">--Vui lòng chọn--</option>
          <option v-for="(subjectType, index) in subjectTypeOption"
                  v-bind:value="subjectType"
                  :key="index">
            {{ subjectType }}</option>
        </select>
        <div class="validation" v-if="errors.subject_type">
          <p v-for="(error, key) in errors.subject_type" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Hệ số môn học</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingSubject.credit_value"
          class="form-control"
        />
        <div class="validation" v-if="errors.credit_value">
          <p v-for="(error, key) in errors.credit_value" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Khoa</label>
      <div class="col-sm-10">
        <select v-model="creatingSubject.department" class="form-control">
          <option v-bind:value="null">--Vui lòng chọn--</option>
          <option v-for="(department, index) in departmentOption"
                  v-bind:value="department"
                  :key="index">
            {{ department }}</option>
        </select>
        <div class="validation" v-if="errors.department">
          <p v-for="(error, key) in errors.department" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Trạng thái</label>
      <div class="col-sm-10">
        <select v-model="creatingSubject.status" class="form-control">
          <option v-bind:value="null">--Vui lòng chọn--</option>
          <option value="active">Kích hoạt</option>
          <option value="archived">Chưa kích hoạt</option>
        </select>
        <div class="validation" v-if="errors.status">
          <p v-for="(error, key) in errors.status" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Miêu tả môn học</label>
      <div class="col-sm-10">
        <textarea rows="4" cols="50"
                  v-model="creatingSubject.jhi_desc"
                  class="form-control"></textarea>
        <div class="validation" v-if="errors.jhi_desc">
          <p v-for="(error, key) in errors.jhi_desc" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Credit</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingSubject.credit_value_number"
          class="form-control"
        />
        <div class="validation" v-if="errors.credit_value_number">
          <p v-for="(error, key) in errors.credit_value_number" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <button
      class="btn btn-primary float-right"
      @click.prevent="save(creatingSubject)"
    >
      Lưu lại
    </button>
  </div>
</template>
<script>
import SubjectApi from "../../../api/subjects";

export default {
  components: {
    SubjectApi
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
    },
    isCreate: Boolean
  },
  data: function() {
    return {
      creatingSubject: this.subject,
      errors: {},
    };
  },
  methods: {
    save: async function() {
      let self = this;

      try {
        const response = this.isCreate
          ? await SubjectApi.createSubject(this.creatingSubject)
          : await SubjectApi.editSubject(this.creatingSubject);

        await this.$swal.fire({
          icon: "success",
          title: "Môn học đã được lưu.",
          showConfirmButton: false,
          timer: 1500
        });

        this.onIndexSubject();
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
    onIndexSubject: function() {
      window.location.replace("/subjects");
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
