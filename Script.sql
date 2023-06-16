
CREATE TABLE public.coordenadores (
                id_coordenador NUMERIC(38) NOT NULL,
                nome_coordenador VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                CONSTRAINT id_coordenador_pk PRIMARY KEY (id_coordenador)
);
COMMENT ON TABLE public.coordenadores IS 'Tabela referente aos coordenadores.';
COMMENT ON COLUMN public.coordenadores.id_coordenador IS 'Número de identificação dos coordenadores.';
COMMENT ON COLUMN public.coordenadores.nome_coordenador IS 'Nome dos coordenadores.';
COMMENT ON COLUMN public.coordenadores.email IS 'Email de contato dos coordenadores.';


CREATE TABLE public.alunos (
                matricula VARCHAR(10) NOT NULL,
                nome_aluno VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                curso VARCHAR(40) NOT NULL,
                endereco VARCHAR(512) NOT NULL,
                CONSTRAINT nome_aluno_pk PRIMARY KEY (matricula)
);
COMMENT ON TABLE public.alunos IS 'Tabela referente aos alunos.';
COMMENT ON COLUMN public.alunos.matricula IS 'Número de matrícula dos alunos.';
COMMENT ON COLUMN public.alunos.nome_aluno IS 'Nome dos alunos.';
COMMENT ON COLUMN public.alunos.email IS 'Email dos alunos.';
COMMENT ON COLUMN public.alunos.curso IS 'Curso dos alunos.';
COMMENT ON COLUMN public.alunos.endereco IS 'Endereço dos alunos.';


CREATE TABLE public.certificados (
                id_certificado NUMERIC(38) NOT NULL,
                data_envio TIMESTAMP NOT NULL,
                materia VARCHAR(100) NOT NULL,
                situacao VARCHAR(15) NOT NULL,
                id_coordenador NUMERIC(38) NOT NULL,
                matricula VARCHAR(10) NOT NULL,
                CONSTRAINT id_certificado_pk PRIMARY KEY (id_certificado)
);
COMMENT ON TABLE public.certificados IS 'Tabela referente aos certificados enviados pelos alunos.';
COMMENT ON COLUMN public.certificados.id_certificado IS 'Número que identifica o certificado.';
COMMENT ON COLUMN public.certificados.data_envio IS 'Data que enviou o certificado.';
COMMENT ON COLUMN public.certificados.materia IS 'Matéria dos certificados dos alunos.';
COMMENT ON COLUMN public.certificados.situacao IS 'Situação do certificado: Aprovado, Pendente e Reprovado.';
COMMENT ON COLUMN public.certificados.id_coordenador IS 'Número de identificação dos coordenadores.';
COMMENT ON COLUMN public.certificados.matricula IS 'Número de matrícula dos alunos.';


CREATE TABLE public.login (
                matricula VARCHAR(10) NOT NULL,
                id_coordenador NUMERIC(38) NOT NULL,
                senha_coordenador VARCHAR(20) NOT NULL,
                senha_aluno VARCHAR(20) NOT NULL,
                CONSTRAINT matricula_id_coordenador PRIMARY KEY (matricula, id_coordenador)
);
COMMENT ON TABLE public.login IS 'Tabela referente ao login dos alunos e coordenadores.';
COMMENT ON COLUMN public.login.matricula IS 'Número de matrícula dos alunos.';
COMMENT ON COLUMN public.login.id_coordenador IS 'Número de identificação dos coordenadores.';
COMMENT ON COLUMN public.login.senha_coordenador IS 'Senha de acesso dos coordenadores.';
COMMENT ON COLUMN public.login.senha_aluno IS 'Senha de acesso dos alunos.';


ALTER TABLE public.login ADD CONSTRAINT coordenadores_login_fk
FOREIGN KEY (id_coordenador)
REFERENCES public.coordenadores (id_coordenador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.certificados ADD CONSTRAINT coordenadores_certificados_fk
FOREIGN KEY (id_coordenador)
REFERENCES public.coordenadores (id_coordenador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.login ADD CONSTRAINT alunos_login_fk
FOREIGN KEY (matricula)
REFERENCES public.alunos (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.certificados ADD CONSTRAINT alunos_certificados_fk
FOREIGN KEY (matricula)
REFERENCES public.alunos (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
