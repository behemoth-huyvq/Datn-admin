<template>
  <tr>
    <td>{{ role.id }}</td>
    <td>{{ role.name }}</td>
    <td>{{ role.description }}</td>
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
          <a href class="dropdown-item" @click.prevent="onEditItem(role.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import RolesApi from "../../../api/roles";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    role: {
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
              const resultDestroy = await RolesApi.destroyRole(
                self.role.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-role");
            } catch (e) {
              self.$toasted.error(resultDestroy.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(roleId) {
      window.location.replace(`/roles/${roleId}/edit`);
    }
  }
};
</script>
