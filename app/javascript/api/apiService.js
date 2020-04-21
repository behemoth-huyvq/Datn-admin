export default class ApiService {
  constructor(context) {
    this.context = context;
  }

  call(process, handleError) {
    this.context.$root.$refs.loading.show();
    process().then(() => {
      setTimeout(() => { this.context.$root.$refs.loading.hide() }, 500);
    }).catch((e) => {
      setTimeout(() => { this.context.$root.$refs.loading.hide() }, 500);
      handleError(e);
    });
  }

}