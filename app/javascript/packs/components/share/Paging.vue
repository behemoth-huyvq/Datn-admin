<template>
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li class="page-item" :class="{ disabled: meta.page==1}" @click.prevent="onPrevious()">
        <a class="page-link" href>Trang trước</a>
      </li>
      <li
        class="page-item"
        v-for="(link, index) in meta.series"
        :key="index"
        :class="{ active: link == meta.page}"
        @click.prevent="onChangePage(link)"
      >
        <a class="page-link" href v-if="link != 'gap'">{{ link }}</a>
        <label class="page-link" v-else>...</label>
      </li>
      <li class="page-item" :class="{ disabled: meta.page == meta.pages }" @click.prevent="onNext()">
        <a class="page-link" href>Trang kế</a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  props: {
    meta: {
      meta: Object,
      required: true
    }
  },
  methods: {
    onChangePage: function(page) {
      if (typeof page != "number") return;
      if (page == this.meta.page) return;

      this.$emit("change-page", page);
    },
    onPrevious: function() {
      const page = this.meta.page;
      if (page == 1) return;
      this.$emit("change-page", page - 1);
    },
    onNext: function() {
      if (this.meta.pages == this.meta.page) return;
      this.$emit("change-page", this.meta.page + 1);
    }
  }
};
</script>