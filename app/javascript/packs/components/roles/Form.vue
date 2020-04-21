<template>
  <div>
    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Tên chức vụ</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingRole.name"
          class="form-control"
        />
        <div class="validation" v-if="errors.name">
          <p v-for="(error, key) in errors.name" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Miêu tả chức vụ</label>
      <div class="col-sm-10">
        <textarea rows="4" cols="50"
                  v-model="creatingRole.description"
                  class="form-control"></textarea>
        <div class="validation" v-if="errors.description">
          <p v-for="(error, key) in errors.description" :key="key">{{ error }}</p>
        </div>
      </div>
    </div>

    <button
      class="btn btn-primary float-right"
      @click.prevent="save(creatingRole)"
    >
      Lưu lại
    </button>
  </div>
</template>
<script>
import RoleApi from "../../../api/roles";

export default {
  components: {
    RoleApi
  },
  props: {
    role: {
      type: Object,
      required: true
    },
    isCreate: Boolean
  },
  data: function() {
    return {
      creatingRole: this.role,
      errors: {},
    };
  },
  methods: {
    save: async function() {
      let self = this;

      try {
        const response = this.isCreate
          ? await RoleApi.createRole(this.creatingRole)
          : await RoleApi.editRole(this.creatingRole);

        await this.$swal.fire({
          icon: "success",
          title: "Chức vụ đã được lưu.",
          showConfirmButton: false,
          timer: 1500
        });

        this.onIndexRole();
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
    onIndexRole: function() {
      window.location.replace("/roles");
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
