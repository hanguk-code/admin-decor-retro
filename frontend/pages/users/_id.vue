<template>
    <div class="mt-5">
        <!-- begin:: Content -->
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head kt-portlet__head--lg">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Карточка покупателя <b>{{ user.name }}</b>
                        </h3>
                    </div>
                </div>


                <form class="kt-form" role="form" @submit.prevent="update" v-loading="loadingOptions">
                    <div class="row">

                        <div class="col-md-4 p-5">
                            <div class="form-group">
                                <div class="form-group">
                                    <label>Имя</label>
                                    <input type="tel" class="form-control" placeholder="Укажите имя покупателя"
                                           v-model="user.name"/>
                                </div>
                                <div class="form-group">
                                    <label>Номер телефона</label>
                                    <input type="tel" class="form-control" placeholder="Укажите номер телефона"
                                           v-model="user.phone"/>
                                </div>
                                <div class="form-group">
                                    <label>E-mail</label>
                                    <input type="email" class="form-control" placeholder="Укажите E-mail"
                                           v-model="user.email"/>
                                </div>
                                <div class="form-group">
                                    <label>Адрес доставки №1</label>
                                    <input type="text" class="form-control" placeholder="Укажите адрес доставки"
                                           v-model="user.address"/>
                                </div>
                                <div class="form-group">
                                    <label>Адрес доставки №2</label>
                                    <input type="text" class="form-control"
                                           v-model="user.address2"/>
                                </div>
                                <div class="form-group">
                                    <label>Адрес доставки №3</label>
                                    <input type="text" class="form-control"
                                           v-model="user.address3"/>
                                </div>
                                <div class="form-group">
                                    <label>Адрес доставки №4</label>
                                    <input type="text" class="form-control"
                                           v-model="user.address4"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Статус</label>
                                <el-select v-model="user.status"
                                           class="form-control fixed-select"
                                           placeholder="Выберите...">
                                    <el-option
                                            v-for="status in statuses"
                                            :key="status.value"
                                            :label="status.label"
                                            :value="status.value"
                                            :class="'bg-' + status.value">
                                    </el-option>
                                </el-select>
                            </div>

                            <div class="form-group" v-loading="loading">
                                <button type="submit" class="btn btn-primary">Сохранить данные</button>
                            </div>

                        </div>

                        <div class="col-md-8 p-5">
                            <!--<DataTableMainUserCard :url="url"
                                           :itemRouteNameEdit="itemRouteNameEdit"
                                           :statuses="statuses"
                                           :permissionEdit="permissionEdit"
                                           :permissionShow="permissionShow"
                            />-->



                            <div class="form-group">
                                <h5>Количество обращений: {{ total_buys }}</h5>
                                <h5>Количество покупок: {{ total_buys_prods }}</h5>
                            </div>
                            <div class="form-group">
                                <h5>Сумма: {{ total_sum }} т.р.</h5>
                            </div>

                            <div class="form-group">
                                <label>Теги покупок</label>
                                <textarea class="form-control" placeholder="Начните вводить теги.."
                                          v-model="user.tags"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Комментарии</label>
                                <textarea class="form-control" placeholder="Начните вводить комментарий.."
                                          v-model="user.comments"></textarea>
                            </div>

                            <div class="row form-group col-md-6">
                                    <label>Фильтр продаж за год:</label>
                                    <input type="number" min="1900" max="2099" maxlength="4" step="1" class="form-control" placeholder="Выберите год.." v-model="filter_year" @change="searchByDate">
                            </div>

                            <table class="table table-bordered">
                                <tr>
                                    <th>Дата продажи</th>
                                    <th>Фото</th>
                                    <th>Артикул</th>
                                    <th>Цена продажи</th>
                                    <th>Скидка</th>
                                    <th>Площадка</th>
                                </tr>
                                <tr v-for="order in orders" :class="order.zone ? 'pointer ' + order.zone : 'pointer'"
                                    :key="order.id">
                                    <td>
                                        {{ order.created_at }}
                                    </td>
                                    <td>
                                        <b v-for="product in order.product_id" style="display: block;" :key="product.product_id">
                                            <img :src="'https://decor-retro.ru/image/' + product.image" width="100"/>
                                        </b>
                                    </td>
                                    <td>
                                        <b v-for="product in order.product_id" style="display: block;" :key="product.product_id">
                                            <n-link :to="{path: '/products/' + product.product_id }"
                                                    class="btn btn-white" :title="product.name">
                                                {{ product.sku }} - {{ product.price }} т.р.
                                            </n-link>
                                        </b>
                                    </td>
                                    <td>
                                        {{ order.total_price }} т.р.
                                    </td>
                                    <td>
                                        {{ order.amount_of_price || 0 }} р.
                                    </td>
                                    <td>
                                        {{ order.type }}
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </form>


            </div>
        </div>
        <!-- end:: Content -->
    </div>
</template>

<script>
    /*import DataTableMainUserCard from '~/components/DataTable/DataTableMainUserCard.vue'*/
    import Errors from '~/helpers/error.js'

    export default {
        middleware: 'auth',
        components: {
            /*DataTableMainUserCard*/
        },
        data() {
            return {
                user: {},
                orders: {},
                total_sum: 0,
                total_buys: 0,
                total_buys_prods: 0,
                filter_year: 2022,
                statuses: [
                    {
                        label: 'Постоянный',
                        value: 'permanent'
                    },
                    {
                        label: 'Черный список',
                        value: 'blacklist'
                    },
                ],

                loading: false,
                loadingOptions: false,
                errors: new Errors(),

                url: process.env.apiWebUrl + `/adm/users/${this.$route.params.id}/orders`,
                itemRouteNameEdit: 'orders-id',
                permissionEdit: ['*'],
                permissionShow: ['*'],
            };
        },

        async fetch() {
            if (!this.$permission(['*'])) {
                await this.$router.push({name: 'index'});
            }
            await this.getUserData()
            await this.getUserOrders()
        },

        methods: {
            async getUserData() {
                const response = await this.$axios.get(process.env.apiWebUrl + `/adm/users/${this.$route.params.id}`)
                if (response) {
                    this.user = response.data;
                }
            },

            async searchByDate() {
                this.total_sum = 0;
                this.total_buys = 0;
                this.total_buys_prods = 0;
                const response = await this.$axios.get(process.env.apiWebUrl + `/adm/users/${this.$route.params.id}/orders`, {
                    params: {
                        search_by_date: this.filter_year
                    }
                })
                if (response) {
                    this.orders = response.data;
                    for (let index in response.data) {
                        let order = response.data[index];
                        this.total_sum += +order.total_price;
                        this.total_buys += 1;
                        this.total_buys_prods += +(order.product_id).length;
                    }
                }
            },

            async getUserOrders() {
                const response = await this.$axios.get(process.env.apiWebUrl + `/adm/users/${this.$route.params.id}/orders`)
                if (response) {
                    this.orders = response.data;
                    for (let index in response.data) {
                        let order = response.data[index];
                        this.total_sum += +order.total_price;
                        this.total_buys += 1;
                        this.total_buys_prods += +(order.product_id).length
                    }
                }
            },

            update() {
                this.loading = true;
                this.$axios.post(process.env.apiWebUrl + `/adm/users/${this.$route.params.id}/update`, {
                    user: this.user,
                })
                    .then(response => {
                        let status = response.data;
                        if (status.status === 'success') {
                            this.$message({
                                showClose: true,
                                message: 'Успешно обновлено',
                                type: 'success',
                                center: true
                            });
                        }
                    })
                    .catch(error => {
                        this.errors.record(error.response.data)
                    })
                    .finally(() => {
                        this.loading = false;
                    });
            },
        }
    }
</script>

<style scoped>
    .bg-permanent {
        background-color: #f44336;
        color: #fff;
    }

    .bg-blacklist {
        background-color: #222222;
        color: #fff;
    }
</style>
