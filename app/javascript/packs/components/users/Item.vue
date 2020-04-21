<template>
  <tr>
    <td>{{ user.id }}</td>
    <td>{{ user.name }}</td>
    <td>{{ user.email }}</td>
    <td>
      <span v-for="ur in user.user_roles" :key="ur.id">
        {{ ur.role.name }}
        <br />
      </span>
    </td>
    <td>
      <div class="dropdown">
        <button
          class="btn btn-secondary dropdown-toggle"
          type="button"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >Thao tác</button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a href class="dropdown-item" @click.prevent="onEditItem(user.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import UsersApi from "../../../api/users";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  },
  methods: {
    onDestroyItem: async function() {
      const self = this;
      this.$swal
        .fire({
          text: "Bạn có muốn xóa nó!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#73c3ab",
          confirmButtonText: "Có",
          cancelButtonText: "Không",
          reverseButtons: true
        })
        .then(async function(result) {
          if (result.value) {
            try {
              self.$root.$refs.loading.show();
              const resultDestroy = await UsersApi.destroyUser(
                self.user.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-user");
            } catch (e) {
              self.$toasted.error(resultDestroy.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(userId) {
      window.location.replace(`/users/${userId}/edit`);
    }
  }
};
</script>
