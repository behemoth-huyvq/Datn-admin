<template>
  <tr>
    <td>{{ student.id }}</td>
    <td>{{ student.student_code }}</td>
    <td>{{ student.name }}</td>
    <td>{{ student.dob }}</td>
    <td>{{ student.class_name }}</td>
    <td>{{ student.program }}</td>
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
          <a href class="dropdown-item" @click.prevent="onEditItem(student.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import StudentsApi from "../../../api/students";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    student: {
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
              const resultDestroy = await StudentsApi.destroyStudent(
                self.student.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-student");
            } catch (e) {
              self.$toasted.error(resultDestroy.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(studentId) {
      window.location.replace(`/students/${studentId}/edit`);
    }
  }
};
</script>
