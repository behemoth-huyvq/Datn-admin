<template>
  <div class="card">
    <div class="card-header card-header-success">
      <h4 class="card-title">Tìm kiếm quyền</h4>
    </div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <div class="row mb-8">
            <div class="col-md-6">
              <label for="name">Theo tên quyền</label>
              <input type="text" class="form-control" id="name" v-model="q.name_cont" />
            </div>
            <div class="col-md-6">
              <label for="name">Theo miêu tả quyền</label>
              <input type="text" class="form-control" id="name" v-model="q.description_cont" />
            </div>
          </div>
        </div>
        <button class="btn btn-success" @click.prevent="onSearch()">Tìm kiếm</button>
        <button class="btn btn-success" @click.prevent="onNewRoles()">Tạo mới quyền</button>
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
        description_cont: null
      }
    };
  },
  methods: {
    onSearch: function() {
      this.$emit("search-roles", this.q);
    },
    onNewRoles: function() {
      window.location.href = "/roles/new";
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