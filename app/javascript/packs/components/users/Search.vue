<template>
  <div class="card">
    <div class="card-header card-header-success">
      <h4 class="card-title">Tìm kiếm quản trị viên</h4>
    </div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <div class="row mb-8">
            <div class="col-md-4">
              <label for="name">Theo tên quản trị viên</label>
              <input type="text" class="form-control" id="name" v-model="q.name_cont" />
            </div>
            <div class="col-md-4">
              <label for="name">Theo miêu tả quản trị viên</label>
              <input type="text" class="form-control" id="name" v-model="q.email_cont" />
            </div>
            <div class="col-md-4">
              <label for="name">Theo chức vụ</label>
              <select v-model="q.role_eq" class="form-control">
                <option v-bind:value="null">--Vui lòng chọn--</option>
                <option v-for="role in roleOptions"
                        v-bind:value="role.value"
                        :key="role.id">
                  {{ role.name }}</option>
              </select>
            </div>
          </div>
        </div>
        <button class="btn btn-success" @click.prevent="onSearch()">Tìm kiếm</button>
        <button class="btn btn-success" @click.prevent="onNewUsers()">Tạo mới quản trị viên</button>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  data: function() {
    return {
      q: {
        name_cont: null,
        email_cont: null,
        role_eq: null
      }
    };
  },
  props: {
    roleOptions: {
      type: Array,
      requied: true
    }
  },
  methods: {
    onSearch: function() {
      this.$emit("search-users", this.q);
    },
    onNewUsers: function() {
      window.location.href = "/users/new";
    }
  }
};
</script>
<style>
.col-search {
  display: flex;
  flex-direction: column;
}
.mb-8 {
  margin-bottom: 8px;
}
</style>