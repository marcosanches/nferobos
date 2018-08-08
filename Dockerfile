FROM marcosanches/centos_php7nfe:v2
LABEL version="1.3.0" description="Servidor CentoOS 6.9 PHP 7 " maintainer="Marco Sanches"
CMD ln -sf /dados/infra/nfe/prd/php.ini /etc/php.ini && \
    ln -sf /dados/infra/nfe/prd/php.d /etc/php.d && \
    ln -sf /dados/infra/nfe/prd/apache/conf /etc/httpd/conf && \
    ln -sf /dados/infra/nfe/prd/apache/conf.d /etc/httpd/conf.d && \
    ln -sf /dados/infra/nfe/prd/apache/logs /etc/httpd/logs && \
    ln -sf /dados/infra/nfe/prd/tls/certs /etc/pki/tls/certs && \
    ln -sf /dados/infra/nfe/prd/tls/misc /etc/pki/tls/misc && \
    ln -sf /dados/infra/nfe/prd/tls/private /etc/pki/tls/private && \
    ln -sf /dados/infra/nfe/prd/tls/openssl.cnf /etc/pki/tls/openssl.cnf && \
    ln -sf /dados/infra/nfe/prd/apache/php_var /etc/httpd/php_var && \
    cp /dados/infra/nfe/prd/robos/* /etc/init.d/ &&\
    for a in `ls -1AN /dados/infra/nfe/prd/robos`; do chmod 0777 /etc/init.d/$a; done  &&\
    for a in `ls -1AN /dados/infra/nfe/prd/robos`; do service $a start; done  &&\
    cat /dados/infra/hosts >> /etc/hosts && \
    service httpd start && \
    service sshd start && \
    /bin/bash
