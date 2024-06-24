


### Clae 15: Práctica de roles en IAM

Pasos para crear el Rol:
- Buscar IAM
- Vamos a Roles / crear Rol
- Seleccionamos el tipo de entidad (AWS Service)
- El tipo de uso (EC2) y Next
- Seleccionamos los permisos que se deban brindar a ese Rol (S3 full Access) y Next
- Le damos un nombre y una descripción a este rol, y luego Create Rol
- Posteriormente le asignamos el rol de este servicio a otro servicio (por ejemplo para que una instancia de ec2 pueda acceder a una de s3 sin necesidad de Access Key):
- En la consola de nuestro servicio ec2 Actions/Security/Modify IAM role
- Seleccionamos el rol que necesitemos y Save

### Clase 18

`**Consejos y/o buenas practicas de AWS**`

- El usuario root no se debe usar.
- Usarla únicamente para crear usuarios y asignarle permisos para poder operar.
- Se deben crear grupos, donde se metan usuarios.
- Crear políticas seguras para la creación de contraseñas.
- Utilizar el MFA, como 2do factor de autenticación.
- Los roles son poderosos, nos permiten ejecutar acciones a nuestro nombre.
- Utilizar servicios como: Access Key, Secret Key y utilizar y la CLI dentro de AWS.
- Utilizar los reportes que nos ofrece la auditoria de los servicios.
- No compartir usuarios.


### Clase 20: Resumen de IAM

- Creamos Usuarios
- Creamos Grupos donde asignamos usuarios
- Creamos Políticas
- Creamos y configuramos Roles
- Configuramos MFA
- Utilizamos el SDK
- Configuramos y utilizamos la CLI


## Commands

```bash
# ask for access key
# the for secret access key
aws configure

# list user
aws iam list-users

# list groups
aws iam list-groups

# list buckets
aws s3 ls

# list buckets
aws s3api list-buckets

```




## References

- [Multi-Factor Authentication (MFA) for IAM](https://aws.amazon.com/iam/features/mfa/)

- [AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)
- [IAM Simulator](https://policysim.aws.amazon.com/home/index.jsp?#)

- [list-users](https://docs.aws.amazon.com/cli/latest/reference/iam/list-users.html)
- [list-buckets](https://docs.aws.amazon.com/cli/latest/reference/s3api/list-buckets.html)

- [What Is An SDK?](https://aws.amazon.com/what-is/sdk/)
- [AWS SDK for Python (Boto3)](https://aws.amazon.com/sdk-for-python/)
- [AWS SDK for JavaScript](https://aws.amazon.com/sdk-for-javascript/)
- [AWS SDK for Java](https://aws.amazon.com/sdk-for-java/)



- [Supported AWS Regions for AWS CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/supported-aws-regions.html)
- [Prácticas recomendadas de seguridad en IAM](https://docs.aws.amazon.com/es_es/IAM/latest/UserGuide/best-practices.html#bp-workloads-use-roles)
- [AWS CloudShell endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/cloudshell.html)
- [Install or update the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)