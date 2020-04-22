<template>
  <div class="card">
    <div class="card-header card-header-success">
      <h4 class="card-title">Tìm kiếm học phần</h4>
    </div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <div class="row mb-8">
            <div class="col-md-6">
              <label for="name">Theo mã học phần</label>
              <input type="text" class="form-control" id="name" v-model="q.course_code_cont" />
            </div>
            <div class="col-md-6">
              <label for="name">Theo trạng thái học phần</label>
              <select v-model="q.status_eq" class="form-control">
                <option v-bind:value="null">--Vui lòng chọn--</option>
                <option v-for="status in statusOption"
                        v-bind:value="status.id"
                        :key="status.value">
                  {{ status.value }}</option>
              </select>
            </div>
          </div>
        </div>
        <button class="btn btn-success" @click.prevent="onSearch()">Tìm kiếm</button>
        <button class="btn btn-success" @click.prevent="onNewSubjects()">Tạo mới học phần</button>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    statusOption: {
      type: Array
    }
  },
  data: function() {
    return {
      q: {
        course_code_cont: null,
        status_eq: null,
      }
    };
  },
  methods: {
    onSearch: function() {
      this.$emit("search-courses", this.q);
    },
    onNewSubjects: function() {
      window.location.href = "/courses/new";
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