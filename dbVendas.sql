-- apagando banco de dados
drop database dbVendas;

-- criando banco de dados
create database dbVendas;

-- acessando o banco de dados
use dbVendas;

create table tbschema_version(
   codInstalled int(11),
   version varchar(50),
   description varchar(200),
   type varchar(1000),
   script varchar(1000),
   checksum int(11),
   instaledby varchar(100),
   instaledon timestamp,
   executionTime int(11),
   sucess tinyint(1) 
);

create table tbEstado(
    codEstado int(11),
    sigla varchar(2),
    primary key(codEstado)
);

create table tbEstilo(
    codEstilo int (11),
    nome varchar(50),
    primary key (codEstilo)
);

create table tbCliente(
    codCli int,
    nome varchar(80),
    tipo_pessoa varchar(15),
    cpf_cpnj char(30),
    telCel char(10),
    email varchar(50),
    logradouro varchar(50),
    numero varchar(15),
    complemento varchar(15),
    cep varchar (15),
    primary key(codCli)
);

create table tbCidade(
    codCidade int (11),
    nome varchar(50),
    codEstado int (20),
    primary key (codCidade),
    foreign key (codEstado) references tbEstado (codEstado)
);

create table tbCerveja(
    codCerveja int (11),
    sku varchar(50),
    nome varchar(80),
    descricao text valor decimal(10,2),
    teor_alcoolico decimal(10,2),
    comissao decimal(10,2),
    sabor varchar(50),
    origem varchar(50),
    qtdEstoque int(11),
    foto varchar(100),
    content_hype varchar(100),
    primary key (codCerveja),
    foreign key (codEstilo) references tbEstilo (codEstilo)
);

create table tbItemVenda(
    codItemVenda int (11),
    quantidade int (11),
    valor_unitario decimal(10,2),
    foreign key (codCerveja) references tbCerveja (codCerveja),
    foreign key (codVenda) references tbVenda (codVenda),
    primary key (codItemVenda)
);

create table tbVenda(
    codVenda int (11),
    data_descricao datetime,
    valor_frete decimal(10,2),
    valor_desconto decimal(10,2),
    valor_total decimal(10,2),
    estatos varchar(30),
    observacao varchar(200),
    data_hora_entrega datetime,
    foreign key (codCli) references tbCliente (codCli),
    foreign key (codUsu) references tbUsuario (CodUsu),
    primary key (codVenda)
);

create table tbUsuario(
    codUsu int (11),
    nome varchar(80),
    email varchar(50),
    senha varchar(20),
    primary key (CodUsu)
);

create table tbUsuGrupo(
   foreign key (codUsu) references tbUsuario (codUsu),
   foreign key (codGrupo) references tbGrupo (codGrupo),
);

create table tbGrupo(
    codGrupo int(11),
    nome varchar(50),
    primary key (codGrupo)
);

create table tbGrupoPermissao(
    foreign key (codGrupo) references tbGrupo (codGrupo),
    foreign key (codPermissao) references tbPermissao (codPermissao)
);

create table tbPermissao(
    codPermissao int(11),
    nome varchar(50),
    primary key (codPermissao)
);

-- visualizando a estrutura das tabelas
desc tbschema_version;
desc tbEstado;
desc tbEstilo;
desc tbCliente;
desc tbCidade;
desc tbCerveja;
desc tbItemVenda;
desc tbVenda;
desc tbUsuario;
desc tbUsuGrupo;
desc tbGrupo;
desc tbGrupoPermissao;
desc tbPermissao;


-- inserindo os registros nas tabelas
insert into tbEstado(codEstado,sigla)values(10,"SP");
insert into tbEstado(codEstado,sigla)values(12,"BH");
insert into tbEstado(codEstado,sigla)values(13,"RJ");

insert into tbEstilo(codEstilo,nome)values(1,"Skol");
insert into tbEstilo(codEstilo,nome)values(2,"Brahma");
insert into tbEstilo(codEstilo,nome)values(3,"Itaipava");

insert into tbCliente(codCli,nome,tipo_pesssoa,cpf_cjpj,telCel,email,logadouro,numero,complemento,cep)values(100,"José Emanuel da Silva","Homem","560.599.982-22");





