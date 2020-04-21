<template>
  <div>
    <Search v-on:search-users="onSearch" :role-options="roleOptions"/>
    <div class="card">
      <div class="card-header card-header-success">
        <h4 class="card-title">Danh sách quản trị viên</h4>
        <p class="card-category"></p>
      </div>
      <div class="card-body">
        <div v-if="usersList.length > 0">
          <Paging :meta="meta" v-on:change-page="onChangePage" />
          <div class="table-responsive">
            <table class="table">
              <thead class="text-primary">
                <tr>
                  <th width="10%">Id</th>
                  <th width="25%">Tên quản trị viên</th>
                  <th width="25%">Email</th>
                  <th width="25%">Chức vụ</th>
                  <th width="10%">Hành động</th>
                </tr>
              </thead>
              <tbody>
                <Item
                  v-for="user in usersList"
                  :key="user.id"
                  :user="user"
                  v-on:delete-user="onDelete"
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
import UsersApi from "../../../api/users";

export default {
  components: {
    Item,
    Paging,
    Search
  },
  data: function() {
    return {
      usersList: [],
      page: 1,
      perPage: 50,
      meta: {},
      searchData: null,
      q: {}
    };
  },
  props: {
    roleOptions: {
      type: Array,
      reuired: true
    }
  },
  created: function() {
    this.fetchUsersList();
  },
  methods: {
    fetchUsersList: async function() {
      const params = {
        q: this.q,
        page: this.page,
        per_page: this.perPage
      };
      
      try {
        this.$root.$refs.Loading.show();
        const result = await UsersApi.getUsersList(params);
        this.usersList = result.data.users;
        this.meta = Object.assign({}, this.meta, result.data.meta);
        this.page = this.meta.page;
      } catch (e) {
        console.log(e.message);
      } finally {
        this.$root.$refs.Loading.hide();
      }
    },
    onChangePage: function(page) {
      this.page = page;
      this.fetchUsersList();
    },
    onSearch: async function(params) {
      this.q = params;
      this.fetchUsersList();
    },
    onDelete: function() {
      this.fetchUsersList();
    }
  }
};
</script>