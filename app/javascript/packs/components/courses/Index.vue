<template>
  <div>
    <Search v-on:search-courses="onSearch"
            :status-option="statusOption"/>
    <div class="card">
      <div class="card-header card-header-success">
        <h4 class="card-title">Danh sách học phần</h4>
        <p class="card-category"></p>
      </div>
      <div class="card-body">
        <div v-if="coursesList.length > 0">
          <Paging :meta="meta" v-on:change-page="onChangePage" />
          <div class="table-responsive">
            <table class="table">
              <thead class="text-primary">
                <tr>
                  <th width="5%">Id</th>
                  <th width="10%">Mã học phần</th>
                  <th width="15%">Số lượng sinh viên giới hạn</th>
                  <th width="10%">Trạng thái</th>
                  <th width="15%">Môn học</th>
                  <th width="15%">Số lượng sinh viên đăng ký</th>
                  <th width="10%">Hành động</th>
                </tr>
              </thead>
              <tbody>
                <Item
                  v-for="course in coursesList"
                  :key="course.id"
                  :course="course"
                  v-on:delete-course="onDelete"
                />
              </tbody>
            </table>
          </div>
          <Paging :meta="meta" v-on:change-page="onChangePage" />
        </div>
        <div v-else>
          <h3>Không có dữ liệu phù hợp</h3>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Item from "./Item";
import Paging from "../share/Paging";
import Search from "./Search";
import CoursesApi from "../../../api/courses";

export default {
  components: {
    Item,
    Paging,
    Search
  },
  props: {
    statusOption: {
      type: Array
    }
  },
  data: function() {
    return {
      coursesList: [],
      page: 1,
      perPage: 50,
      meta: {},
      searchData: null,
      q: {}
    };
  },
  created: function() {
    this.fetchCoursesList();
  },
  methods: {
    fetchCoursesList: async function() {
      const params = {
        q: this.q,
        page: this.page,
        per_page: this.perPage
      };
      
      try {
        this.$root.$refs.loading.show();
        const result = await CoursesApi.getCoursesList(params);
        this.coursesList = result.data.courses;
        this.meta = Object.assign({}, this.meta, result.data.meta);
        this.page = this.meta.page;
      } catch (e) {
        console.log(e.message);
      } finally {
        this.$root.$refs.loading.hide();
      }
    },
    onChangePage: function(page) {
      this.page = page;
      this.fetchCoursesList();
    },
    onSearch: async function(params) {
      this.q = params;
      this.fetchCoursesList();
    },
    onDelete: function() {
      this.fetchCoursesList();
    }
  }
};
</script>