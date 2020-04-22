<template>
  <tr>
    <td>{{ subject.id }}</td>
    <td>{{ subject.subject_code }}</td>
    <td>{{ subject.subject_name }}</td>
    <td>{{ subject.subject_type }}</td>
    <td>{{ subject.credit_value }}</td>
    <td>{{ subject.jhi_desc }}</td>
    <td>{{ subject.department }}</td>
    <td>{{ subject.status }}</td>
    <td>{{ subject.credit_value_number }}</td>
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
          <a href class="dropdown-item" @click.prevent="onEditItem(subject.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import SubjectsApi from "../../../api/subjects";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    subject: {
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
              const resultDestroy = await SubjectsApi.destroySubject(
                self.subject.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-subject");
            } catch (e) {
              self.$toasted.error(resultDestroy.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(subjectId) {
      window.location.replace(`/subjects/${subjectId}/edit`);
    }
  }
};
</script>
