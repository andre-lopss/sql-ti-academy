use turma11;

create schema despachante;

create table ordem_compra.fornecedor(
	cd_fornecedor int primary key identity (1, 1),
	nm_fornecedor varchar (50) not null
);

create table ordem_compra.material(
cd_material int primary key identity(1,1),
nm_material varchar(50) not null,
ds_material varchar(100)
);

create table ordem_compra.ordemcompra(
	cd_ordem_compra int primary key identity (1, 1),
	dt_emissao_ordem_compra date not null,
	cd_fornecedor int not null,
	foreign key(cd_fornecedor) references ordem_compra.fornecedor(cd_fornecedor)
	);

create table ordem_compra.itemordemcompra(
	cd_ordem_compra int not null,
	cd_material int not null,
	qt_material decimal(5,2) not null,
	vl_material money not null,
	primary key(cd_ordem_compra, cd_material),
	foreign key (cd_ordem_compra) references ordem_compra.ordemcompra(cd_ordem_compra),
	foreign key (cd_material) references ordem_compra.material(cd_material)
	);

create table despachante.proprietario(
	cd_cpf_proprietario varchar (11) primary key,
	nm_proprietario varchar (50)
	);

create table despachante.veiculo(
	cd_veiculo int primary key identity (1,1),
	nm_veiculo varchar (50),
	cd_cpf_proprietario varchar(11)
	foreign key (cd_cpf_proprietario) references despachante.proprietario,
);

create table despachante.licenciamento(
	cd_veiculo int not null,
	foreign key (cd_veiculo) references despachante.veiculo,
	dt_licenciamento date primary key not null,
	vl_licenciamento money not null
);

create schema padaria;

create table padaria.filial(
	cd_filial int primary key identity(1,1),
	nm_filial varchar (50) not null
	);

create table padaria.forno(
	cd_forno int primary key identity (1,1),
	qt_producao_forno decimal not null,
	cd_filial int not null,
	foreign key (cd_filial) references padaria.filial
);

create table padaria.produto(
	cd_forno int not null,
	cd_tipoproduto int not null,
	dt_producao datetime,
	primary key(cd_forno, cd_tipoproduto, dt_producao),
	foreign key(cd_forno) references padaria.forno,
	dt_validade date not null
	foreign key(cd_tipoproduto) references padaria.tipoproduto,
)

drop table padaria.produto

create table padaria.tipoproduto(
	cd_tipoproduto int primary key identity (1,1),
	nm_produto varchar (50)
);


create table padaria.materiaprima(
	cd_materiaprima int primary key identity (1,1),
	nm_materiaprima varchar (50) not null
);

create table padaria.receita(
	cd_tipoproduto int not null,
	cd_materiaprima int not null,
	primary key(cd_tipoproduto, cd_materiaprima),
	foreign key(cd_tipoproduto) references padaria.tipoproduto,
	foreign key(cd_materiaprima) references padaria.materiaprima,
	qt_materiaprima decimal not null
);

create table padaria.fornecedor(
	cd_fornecedor int primary key identity (1,1),
	nm_fornecedor varchar(50)
);


create table padaria.fornecimento(
	cd_materiaprima int not null,
	cd_fornecedor int not null,
	primary key (cd_materiaprima, cd_fornecedor),
	foreign key(cd_materiaprima) references padaria.materiaprima,
	foreign key(cd_fornecedor) references padaria.fornecedor,
);
