<template>
  <div class="card">
    <div class="card-header card-header-success">
      <h4 class="card-title">Tìm kiếm lịch học</h4>
    </div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <div class="row mb-8">
            <div class="col-md-4">
              <label for="name">Theo địa điểm học</label>
              <input type="text" class="form-control" id="name" v-model="q.location_cont" />
            </div>
          </div>
        </div>
        <button class="btn btn-success" @click.prevent="onSearch()">Tìm kiếm</button>
        <button class="btn btn-success" @click.prevent="onNewSubjects()">Tạo mới lịch học</button>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  data: function() {
    return {
      q: {
        location_cont: null,
      }
    };
  },
  methods: {
    onSearch: function() {
      this.$emit("search-schedules", this.q);
    },
    onNewSubjects: function() {
      window.location.href = "/schedules/new";
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