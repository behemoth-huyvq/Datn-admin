<template>
  <tr>
    <td>{{ schedule.id }}</td>
    <td>{{ schedule.week_value }}</td>
    <td>{{ schedule.week_day_value }}</td>
    <td>{{ schedule.period_value }}</td>
    <td>{{ schedule.location }}</td>
    <td>{{ schedule.course.course_code }}</td>
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
          <a href class="dropdown-item" @click.prevent="onEditItem(schedule.id)">Chỉnh sửa</a>
          <a href class="dropdown-item" @click.prevent="onDestroyItem()">Xoá</a>
        </div>
      </div>
    </td>
  </tr>
</template>
<script>
import SchedulesApi from "../../../api/schedules";

export default {
  data: function() {
    return {
      showing: false
    };
  },
  props: {
    schedule: {
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
              const resultDestroy = await SchedulesApi.destroySchedule(
                self.schedule.id
              );
              self.$toasted.success(resultDestroy.data.message);
              self.$emit("delete-schedule");
            } catch (e) {
              self.$toasted.error(e.response.data.message);
            } finally {
              self.$root.$refs.loading.hide();
            }
          }
        });
    },
    onEditItem: function(scheduleId) {
      window.location.replace(`/schedules/${scheduleId}/edit`);
    }
  }
};
</script>
