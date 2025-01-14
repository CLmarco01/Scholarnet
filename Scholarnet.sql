PGDMP         1                {        
   Scholarnet    15.2    15.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    65655 
   Scholarnet    DATABASE        CREATE DATABASE "Scholarnet" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "Scholarnet";
                postgres    false            �            1259    73867    commento    TABLE       CREATE TABLE public.commento (
    email character varying(50) NOT NULL,
    descrizione character varying(180),
    pubblicazione timestamp without time zone NOT NULL,
    titolo character varying(255) NOT NULL,
    data_commento timestamp without time zone
);
    DROP TABLE public.commento;
       public         heap    postgres    false            �            1259    73870    compito    TABLE     �  CREATE TABLE public.compito (
    classe character varying(8) NOT NULL,
    titolo character varying(255) NOT NULL,
    testo text NOT NULL,
    allegati character varying(255),
    utente character varying(255) NOT NULL,
    data_scadenza date,
    ora time without time zone,
    pubblicazione timestamp without time zone NOT NULL,
    email character varying(50),
    id_post character varying(8) NOT NULL
);
    DROP TABLE public.compito;
       public         heap    postgres    false            �            1259    65661    corso    TABLE     �   CREATE TABLE public.corso (
    codice character varying(8) NOT NULL,
    nome character varying(50) NOT NULL,
    materia character varying(50),
    link character varying(150) NOT NULL,
    link_imm character varying(150) NOT NULL
);
    DROP TABLE public.corso;
       public         heap    postgres    false            �            1259    65664    insegna    TABLE     v   CREATE TABLE public.insegna (
    docente character varying(50) NOT NULL,
    corso character varying(50) NOT NULL
);
    DROP TABLE public.insegna;
       public         heap    postgres    false            �            1259    65667 	   partecipa    TABLE     y   CREATE TABLE public.partecipa (
    studente character varying(50) NOT NULL,
    corso character varying(50) NOT NULL
);
    DROP TABLE public.partecipa;
       public         heap    postgres    false            �            1259    65670 
   recensione    TABLE       CREATE TABLE public.recensione (
    utente character varying(50) NOT NULL,
    data timestamp without time zone NOT NULL,
    stelle character varying(5) NOT NULL,
    descrizione character varying(250) DEFAULT NULL::character varying,
    nome_recensione character varying(100)
);
    DROP TABLE public.recensione;
       public         heap    postgres    false            �            1259    65674    utente    TABLE     �  CREATE TABLE public.utente (
    nome character varying(30) NOT NULL,
    cognome character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    pass character varying(100) NOT NULL,
    istituto character varying(50),
    sesso character varying(10) NOT NULL,
    "dataN" date NOT NULL,
    "flagStudente" boolean,
    telefono character varying(20) DEFAULT ''::character varying NOT NULL,
    data_iscrizione date,
    immagine character varying(100)
);
    DROP TABLE public.utente;
       public         heap    postgres    false            $          0    73867    commento 
   TABLE DATA           \   COPY public.commento (email, descrizione, pubblicazione, titolo, data_commento) FROM stdin;
    public          postgres    false    219   �'       %          0    73870    compito 
   TABLE DATA           }   COPY public.compito (classe, titolo, testo, allegati, utente, data_scadenza, ora, pubblicazione, email, id_post) FROM stdin;
    public          postgres    false    220   )                 0    65661    corso 
   TABLE DATA           F   COPY public.corso (codice, nome, materia, link, link_imm) FROM stdin;
    public          postgres    false    214   Z+                  0    65664    insegna 
   TABLE DATA           1   COPY public.insegna (docente, corso) FROM stdin;
    public          postgres    false    215   �+       !          0    65667 	   partecipa 
   TABLE DATA           4   COPY public.partecipa (studente, corso) FROM stdin;
    public          postgres    false    216   B,       "          0    65670 
   recensione 
   TABLE DATA           X   COPY public.recensione (utente, data, stelle, descrizione, nome_recensione) FROM stdin;
    public          postgres    false    217   �,       #          0    65674    utente 
   TABLE DATA           �   COPY public.utente (nome, cognome, email, pass, istituto, sesso, "dataN", "flagStudente", telefono, data_iscrizione, immagine) FROM stdin;
    public          postgres    false    218   70                  2606    65679    corso corso_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (codice);
 :   ALTER TABLE ONLY public.corso DROP CONSTRAINT corso_pkey;
       public            postgres    false    214            �           2606    73876    compito pk_compito 
   CONSTRAINT     c   ALTER TABLE ONLY public.compito
    ADD CONSTRAINT pk_compito PRIMARY KEY (pubblicazione, titolo);
 <   ALTER TABLE ONLY public.compito DROP CONSTRAINT pk_compito;
       public            postgres    false    220    220            �           2606    65681    partecipa pk_partecipa 
   CONSTRAINT     a   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT pk_partecipa PRIMARY KEY (studente, corso);
 @   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT pk_partecipa;
       public            postgres    false    216    216            �           2606    65683    recensione pk_recensione 
   CONSTRAINT     `   ALTER TABLE ONLY public.recensione
    ADD CONSTRAINT pk_recensione PRIMARY KEY (utente, data);
 B   ALTER TABLE ONLY public.recensione DROP CONSTRAINT pk_recensione;
       public            postgres    false    217    217            �           2606    65685    insegna primary_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.insegna
    ADD CONSTRAINT primary_key PRIMARY KEY (docente, corso);
 =   ALTER TABLE ONLY public.insegna DROP CONSTRAINT primary_key;
       public            postgres    false    215    215            �           2606    65687    utente utente_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_pkey PRIMARY KEY (email);
 <   ALTER TABLE ONLY public.utente DROP CONSTRAINT utente_pkey;
       public            postgres    false    218            �           2606    73877    compito compito_classe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compito
    ADD CONSTRAINT compito_classe_fkey FOREIGN KEY (classe) REFERENCES public.corso(codice) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.compito DROP CONSTRAINT compito_classe_fkey;
       public          postgres    false    3199    220    214            �           2606    73882    commento fk_commento    FK CONSTRAINT     �   ALTER TABLE ONLY public.commento
    ADD CONSTRAINT fk_commento FOREIGN KEY (pubblicazione, titolo) REFERENCES public.compito(pubblicazione, titolo) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.commento DROP CONSTRAINT fk_commento;
       public          postgres    false    219    220    3209    219    220            �           2606    65693    partecipa fk_corso    FK CONSTRAINT     �   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT fk_corso FOREIGN KEY (corso) REFERENCES public.corso(codice) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT fk_corso;
       public          postgres    false    216    214    3199            �           2606    65698    insegna fk_corso    FK CONSTRAINT     �   ALTER TABLE ONLY public.insegna
    ADD CONSTRAINT fk_corso FOREIGN KEY (corso) REFERENCES public.corso(codice) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 :   ALTER TABLE ONLY public.insegna DROP CONSTRAINT fk_corso;
       public          postgres    false    215    3199    214            �           2606    65703    insegna fk_docente    FK CONSTRAINT     �   ALTER TABLE ONLY public.insegna
    ADD CONSTRAINT fk_docente FOREIGN KEY (docente) REFERENCES public.utente(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.insegna DROP CONSTRAINT fk_docente;
       public          postgres    false    215    3207    218            �           2606    65708    partecipa fk_studente    FK CONSTRAINT     �   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT fk_studente FOREIGN KEY (studente) REFERENCES public.utente(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT fk_studente;
       public          postgres    false    218    216    3207            �           2606    65715    recensione utente_recens_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.recensione
    ADD CONSTRAINT utente_recens_fk FOREIGN KEY (utente) REFERENCES public.utente(email) NOT VALID;
 E   ALTER TABLE ONLY public.recensione DROP CONSTRAINT utente_recens_fk;
       public          postgres    false    218    3207    217            $   E  x���=o�0�g�שS*!JXڪ�P)C�J��p�'�#C~}A*��Y`�<��}�:ߒr�=t=��kt�������M���X�r�m!+�bS��Eq�O�X}v |-+!R��U;CuM`�����q��,�fB"H
oE���G�r���|>vo��|��@�)@����ĺ�w�~�>*�D�1z{	��ns��l���������nI/�B�VC��1x��4�����s#��k���I�GK?�����"D<kN�Ůl�Z/\���5��a�v�p(����al�AG�k>Z�n�r�ް��a��d�vڪ�5��U��ϻ4M ���7      %   9  x��S͎�0>���[/�$B�[�J��r���^�d�Zrl�8H�i�.}��,ۅU�������q��,ާ���i`ilg���э4V���� '�]���@���o!���I��Yn[̩]�:r�ڍ�����i�3��^�Kg�K{�����i,�-BM
*P)jЙ��=2�:�0����Q����h�����Eݓ"X)I��6X��k��P��0G9Dige\T'���c&�y�y,���Y�UG�b��Ҵ;E-�j�����	���������%X�%+[�Lݫtw���7{3����~�,�@�eZ�a��F����d"���Bã�NB�{�5Cڣ���؍��O�+ҵ�8�/~������e��WM���b<;�����VV�s �:��#1�{�����x�$�gq~~�cC���m]2.���Z�"�"�̲�.OC�	�f�>^K���5y��紦���T�i*hp�����:�~�o�Yh��{	�6�t�a���׉eJI)n$v�E����:��<�L@}����{p<��B���FEͼ�Wj�	qvZ��8����d4��Rl�         �   x����4qs3���KOM�K-�LT��K�/�M,�LN�t�K��,�T�����w�I,.΄P��^P�z Y ��M�����6��*H������s�tO��M-md`d�$�b���a1�X� /�+F��� \38�          E   x�KMIMJL�p�L�����,����4qs3�*(�O30tH�M���K��EȤ�������s����� x�}      !   6   x�+.)MI�+I5tH�M���K������4qs3�*�J�4�'i�M2F��� ��&�      "   �  x�}UK��6\˧�n6�!���W3A2AA��Vٴ��� -
$e �49C�0K5�y~�K -H쮮�.r�55��ٹ�Ĭ��b����)�Cu��g���Bf��N��;{c�t���M�ֲ�w�J��	���o͙w�����M����Æ��s�ʅ��6�w��cw!���]I�ͫm�d��Ϗy�Uٯ���4ڭ��*9�Q/���� B����*�D1$�",&ı�!�eߝN�H*�F�8��!�Ð/����}����Wd|e@�f��!d����=@@]���<E�򳋌�	ĵd�U,�͌��(����9�I|�����tp%$��w��"�z+=�����:0��ľi�N�B����HR�$?:�cT��[�1b��7���Х�*� twU��zZ,luu>A�:fŲ�Rl���J��4�T�T��|I	f	�F4���*MsNߢ'u��e�Ҫ��5"ՒD\���a�?i{5h��Qs�b���o���Y�*�Yw��U̞���ڡz���� �EYA�_$8z[iu�|�����V�:\oF}0=\"8�m���ȗ�PP�թQ��1:*AiS�:�ޖ{S��F��Sn�K^2s�H�0������8wk��ui���۱!�t�� IWXaA���P�3�к�o���a���	�.���%�����t!߸�yږO�RU)E�������_)A6�V���::�L��VO4|�w ��{U�%>&���|��?���a��QI�j�0�Ŵ�Q�6��-����t�R���
�##4��6�ـ�!-�W��4Hy>� A� 5(�	޺Pr]��M�`��Y$���+�1�jL��7���s�������|�wk>��!q�Wgo�%Z��j�RO�}rk�.1ț?w���_6�F      #   �  x����n�0���)x#ېvmӟM#E�.gs.�ؑm"�O?:QhА�@؜�s�1p�e��;8�!��I
�2�Ҍ�Y��  ۂ/j�L��b��}0��J�Xp������`�h�v���|�Jm�� ^!���� �Rq%Y�8���&XC�\g� u	���.6.1�bƎP�%��#��4Τ�+J�E�S1o�t����f���0�l�Ŋ�K��]pv���6��hG���E�R�uۢ�]�\����}�!�s��M]����B�}&Y�'t&��@yg�mS��S7V3��Ԭa}��ň��H#:���P\ʫ,*oaًC0��t{2��7F/���r.�gx��;:)�,n�W}u��?�O-�N7:~jP�G�E�t9\�>��6�p�ad�I�4ϲ\��+t�}�}�T����moN�:�̇?JN�^Y,Hw6��IEZ�o[     