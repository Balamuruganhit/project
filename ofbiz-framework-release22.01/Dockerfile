# syntax=docker/dockerfile:1

#####################################################################
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#####################################################################

FROM eclipse-temurin:17 AS builder

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /builder

# Copy Gradle wrapper
COPY --chmod=755 gradle/init-gradle-wrapper.sh gradle/
COPY --chmod=755 gradlew .

# Fix Gradle wrapper script
RUN ["sed", "-i", "s/shasum/sha1sum/g", "gradle/init-gradle-wrapper.sh"]
RUN ["gradle/init-gradle-wrapper.sh"]

# Trigger Gradle distribution download
RUN --mount=type=cache,id=gradle-cache,sharing=locked,target=/root/.gradle \
    ["./gradlew", "--console", "plain"]

# Copy OFBiz sources
COPY buildSrc/ buildSrc/
COPY applications/ applications/
COPY config/ config/
COPY framework/ framework/
COPY gradle/ gradle/
COPY lib/ lib/
COPY plugin[s]/ plugins/
COPY themes/ themes/
COPY APACHE2_HEADER build.gradle common.gradle gradle.properties NOTICE settings.gradle .

# **Skip Checkstyle during build**
RUN --mount=type=cache,id=gradle-cache,sharing=locked,target=/root/.gradle \
    --mount=type=tmpfs,target=runtime/tmp \
    ["./gradlew", "--console", "plain", "distTar", "-x", "checkstyleMain", "-x", "checkstyleTest"]

###################################################################################

FROM eclipse-temurin:17 AS runtimebase

# Install xsltproc for OFBiz
RUN apt-get update \
    && apt-get install -y --no-install-recommends xsltproc \
    && rm -rf /var/lib/apt/lists/*

RUN ["useradd", "ofbiz"]

# Create necessary directories
RUN ["mkdir", "--parents", \
    "/docker-entrypoint-hooks/before-config-applied.d", \
    "/docker-entrypoint-hooks/after-config-applied.d", \
    "/docker-entrypoint-hooks/before-data-load.d", \
    "/docker-entrypoint-hooks/after-data-load.d", \
    "/docker-entrypoint-hooks/additional-data.d"]
RUN ["/usr/bin/chown", "-R", "ofbiz:ofbiz", "/docker-entrypoint-hooks" ]

USER ofbiz
WORKDIR /ofbiz

# Extract OFBiz tar from builder
COPY --from=builder /builder/build/distributions/ofbiz.tar /mnt/ofbiz.tar
RUN --mount=type=bind,from=builder,source=/builder/build/distributions/ofbiz.tar,target=/mnt/ofbiz.tar \
    ["tar", "--extract", "--strip-components=1", "--file=/mnt/ofbiz.tar"]

# Create directories for volume mounts
RUN ["mkdir", "/ofbiz/runtime", "/ofbiz/config", "/ofbiz/lib-extra"]

# Append Java runtime version to VERSION file
COPY --chmod=644 --chown=ofbiz:ofbiz VERSION .
RUN echo '${uiLabelMap.CommonJavaVersion}:' "$(java --version | grep Runtime | sed 's/.*Runtime Environment //; s/ (build.*//;')" >> /ofbiz/VERSION

# Set executable scripts permissions
COPY --chmod=555 docker/docker-entrypoint.sh docker/send_ofbiz_stop_signal.sh .

COPY --chmod=444 docker/disable-component.xslt .
COPY --chmod=444 docker/templates templates

# Expose required ports
EXPOSE 9443
EXPOSE 9090
EXPOSE 5006

ENTRYPOINT ["/ofbiz/docker-entrypoint.sh"]
CMD ["bin/ofbiz"]

###################################################################################
# Demo image with preloaded data
FROM runtimebase AS demo

USER ofbiz

RUN /ofbiz/bin/ofbiz --load-data
RUN mkdir --parents /ofbiz/runtime/container_state
RUN touch /ofbiz/runtime/container_state/data_loaded
RUN touch /ofbiz/runtime/container_state/admin_loaded
RUN touch /ofbiz/runtime/container_state/db_config_applied

VOLUME ["/docker-entrypoint-hooks"]
VOLUME ["/ofbiz/config", "/ofbiz/runtime", "/ofbiz/lib-extra"]

###################################################################################
# Runtime image without preloaded data
FROM runtimebase AS runtime

USER ofbiz

VOLUME ["/docker-entrypoint-hooks"]
VOLUME ["/ofbiz/config", "/ofbiz/runtime", "/ofbiz/lib-extra"]
