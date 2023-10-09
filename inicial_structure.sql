create table usuario (
    id bigserial primary key,
    email text unique,
    senha text,
    primeiro_nome text,
    sobrenome text,
    contato text,
    tipo text,
    data_criacao timestamp default now(),
    ativo boolean,
    status text
);


create table grupo (
    id bigserial primary key,
    nome text,
    data_criacao timestamp default now(),
    ativo boolean
);

create table usuario_grupo (
    id_usuario bigint,
    id_grupo bigint,
    data_criacao timestamp default now(),
    ativo boolean,
    primary key (id_usuario, id_grupo),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_grupo) references grupo(id)
);

create table mensagem (
    id bigserial primary key,
    id_usuario bigint not null,
    id_grupo bigint not null,
    id_mensagem_resposta bigint,
    mensagem bytea not null,
    tipo_mensagem text,
    data_criacao timestamp default now(),
    ativo boolean,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_grupo) references grupo(id)
);

create table permissao (
    id bigserial primary key,
    nome text,
    data_criacao timestamp default now(),
    ativo boolean
);

create table perfil (
    id bigserial primary key,
    nome text,
    data_criacao timestamp default now(),
    ativo boolean
);

create table perfil_permissao (
    id_perfil bigint,
    id_permissao bigint,
    data_criacao timestamp default now(),
    ativo boolean,
    primary key (id_perfil, id_permissao),
    foreign key (id_perfil) references perfil(id),
    foreign key (id_permissao) references permissao(id)
);

create table perfil_usuario(
    id_perfil bigint,
    id_usuario bigint,
    data_criacao timestamp default now(),
    ativo boolean,
    primary key (id_perfil, id_usuario),
    foreign key (id_perfil) references perfil(id),
    foreign key (id_usuario) references usuario(id)
);

create table tipo_veiculo (
    id bigserial primary key,
    nome text,
    data_criacao timestamp default now(),
    ativo boolean
);

create table veiculo (
    id bigserial primary key,
    id_usuario bigint,
    id_tipo_veiculo bigint,
    placa text,
    modelo text,
    cor text,
    data_criacao timestamp default now(),
    ativo boolean,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_tipo_veiculo) references tipo_veiculo(id)
);

create table avaliacao (
    id bigserial primary key,
    id_usuario bigint,
    id_veiculo bigint,
    nota numeric(2,1),
    data_criacao timestamp default now(),
    ativo boolean,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_veiculo) references veiculo(id)
);
