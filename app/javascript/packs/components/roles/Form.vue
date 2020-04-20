<template>
  <div>
    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Tên quyền</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingRole.name"
          class="form-control"
        />
        <span v-for="(error, key) in errors.name" :key="key" class="error">{{
          error
        }}</span>
      </div>
    </div>

    <div class="form-group row">
      <label for="kind" class="col-sm-2 col-form-label">Miêu tả quyền</label>
      <div class="col-sm-10">
        <input
          type="text"
          v-model="creatingRole.description"
          class="form-control"
        />
        <span v-for="(error, key) in errors.description" :key="key" class="error">{{
          error
        }}</span>
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
          title: "Quyền của bạn đã được lưu.",
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
