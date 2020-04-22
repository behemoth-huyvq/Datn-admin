<template>
  <tr>
    <td>{{ course.id }}</td>
    <td>{{ course.course_code }}</td>
    <td>{{ course.max_slot }}</td>
    <td>{{ course.status_i18n }}</td>
    <td>{{ course.subject.subject_name }}</td>
    <td>{{ course.current_slot }}</td>
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
          <a href class="dropdown-item" @click.prevent="onEditItem(course.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import CourseApi from "../../../api/courses";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    course: {
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
              const resultDestroy = await CourseApi.destroyCourse(
                self.course.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-course");
            } catch (e) {
              self.$toasted.error(e.response.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(courseId) {
      window.location.replace(`/courses/${courseId}/edit`);
    }
  }
};
</script>
