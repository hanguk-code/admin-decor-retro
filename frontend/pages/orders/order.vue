<template>
    <div>

        <form class="kt-form" role="form" @submit.prevent="create">
            <div class="card col-6 py-3">

                <div class="card-body">

                    <div class="form-group col-12">
                        <label>Продано на</label>
                        <select class="form-control" v-model="order.type">
                            <option value="Сайте" selected>Сайте</option>
                            <option value="Avito">Авито</option>
                            <option value="Mewke">Мешке</option>
                            <option value="Auction">Аукционе</option>
                            <option value="Instagram">Инстаграм</option>
                        </select>
                    </div>

                    <div class="form-group col-12" v-if="order.type === 'site'">
                        <div class="form-group">
                        <label>Тип:</label>
                            <select class="form-control" v-model="order.typeTwo">
                                <option value="order" selected>Заказ</option>
                                <option value="call">По звонку</option>
                            </select>
                        </div>

                        <div class="form-group" v-if="order.typeTwo === 'order'">
                            <div class="form-group">
                                <label>Номер заказа</label>
                                <input type="text" class="form-control" v-model="order.order_id"
                                       placeholder="Номер заказа"/>
                            </div>
                        </div>

                        <div class="form-group col-12" v-else>
                            <div class="form-group">
                                <label>Имя</label>
                                <input type="text" class="form-control" v-model="order.name" placeholder="Имя"/>
                            </div>
                            <div class="form-group">
                                <label>Почта</label>
                                <input type="email" class="form-control" v-model="order.email" placeholder="Почта"/>
                            </div>
                            <div class="form-group">
                                <label>Номер телефона</label>
                                <input type="tel" class="form-control" v-model="order.phone"
                                       placeholder="Номер телефона"/>
                            </div>
                        </div>

                    </div>

                    <div class="form-group col-12" v-else-if="order.type !== 'site'">
                        <div class="form-group">
                            <label>Имя</label>
                            <input type="text" class="form-control" v-model="order.name" placeholder="Имя"/>
                        </div>
                        <div class="form-group">
                            <label>Почта</label>
                            <input type="email" class="form-control" v-model="order.email" placeholder="Почта"/>
                        </div>
                        <div class="form-group">
                            <label>Номер телефона</label>
                            <input type="tel" class="form-control" v-model="order.phone" placeholder="Номер телефона"/>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">Добавить в заказы</button>

                </div>

            </div>
        </form>

    </div>
</template>

<script>

    export default {
        middleware: 'auth',
        data() {
            return {
                loading: false,
                loadingOptions: false,
                order: {
                    order_id: "",
                    name: "",
                    phone: "",
                    email: "",
                    type: "Сайте",
                    typeTwo: ""
                }
            };
        },
        methods: {
            create() {
                this.loading = true;
                this.$axios.post(process.env.apiWebUrl + `/adm/orders/${this.$route.query.product_id}/create`, {
                    order: this.order,
                })
                    .then(response => {
                        let status = response.data.data;
                        if (status.status === 'success') {
                            this.$message({
                                showClose: true,
                                message: 'Успешно создано',
                                type: 'success',
                                center: true
                            });
                            this.$router.push({path: '/products/' + this.$route.query.product_id});
                        }
                    })
                    .catch(error =>
                        this.errors.record(error.response.data)
                    )
                    .finally(() => {
                        this.loading = false;
                    });
            },

        }
    }
</script>

<style scoped>
    .item__error {
        color: #F56C6C;
        font-size: 11px;
        line-height: 1;
        padding-top: 4px;
        position: absolute;
    }
</style>
