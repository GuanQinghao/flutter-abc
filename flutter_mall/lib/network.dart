import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 基础授权token
const String basicToken = 'Basic Zm9vdGJhbGxfbWF0Y2g6YXBw';
// 接口地址
const String baseURL = 'https://wineduoduo.com/wine-app';

class SharedNetwork {
  // 单例
  static final SharedNetwork _singleton = SharedNetwork._internal();
  Dio _manager;
  factory SharedNetwork() => _singleton;

  // 私有具名构造方法
  SharedNetwork._internal() {
    if (null == _manager) {
      BaseOptions options = BaseOptions(
        // 请求地址, 可以包含子路径
        baseUrl: baseURL,
        // 服务器连接超时时间, 单位是毫秒
        connectTimeout: (1000 * 10),

        // 流方式发送超时时间, 单位是毫秒
        sendTimeout: (1000 * 5),
        // 流方式前后两次接收数据超时时间, 单位为毫秒
        receiveTimeout: (1000 * 5),

        // Http请求头
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },

        // 请求的Content-Type, 默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
        contentType: Headers.formUrlEncodedContentType,
        // 表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
        responseType: ResponseType.json,
      );

      _manager = Dio(options);

      // Cookies管理, 用于Web端请求

      // 拦截器
      _manager.interceptors.add(
        InterceptorsWrapper(
          // 请求前
          onRequest: (RequestOptions options) async {
            //TODO: 这里有问题, _manger只初始化一次, 不会更新本地token
            SharedPreferences preferences =
                await SharedPreferences.getInstance();

            // 本地保存的token
            String token = preferences.get('token');
            if (null == token) {
              // 配置基础授权信息
              options.headers.addAll(
                {
                  'Authorization': basicToken,
                },
              );
            } else {
              // 配置本地的token
              options.headers.addAll(
                {
                  'Authorization': 'bearer $token',
                },
              );
              print('授权信息: bearer $token');
            }

            return options;
          },
          // 成功之前
          onResponse: (Response response) {
            return response;
          },
          // 错误之前
          onError: (DioError e) {
            return e;
          },
        ),
      );
    }
  }

  // GET请求
  get(
    // 请求路径
    String path, {
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 响应返回进度回调
    ProgressCallback progress,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.get(
        path,
        queryParameters: query,
        options: options,
        cancelToken: cancel,
        onReceiveProgress: progress,
      );
      // 请求成功
      _requestSuccessful('GET请求', response);

      // 成功回调
      if (null != success) {
        success(response.data);
      }
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);

      // 失败回调
      if (null != fail) {
        fail(e.response);
      }
    }
  }

  // POST请求
  post(
    // 请求路径
    String path, {
    // 请求数据 - 用于流方式发送表单数据
    dynamic data,
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 请求进度回调
    ProgressCallback sendProgress,
    // 响应进度回调
    ProgressCallback receiveProgress,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.post(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancel,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      // 请求成功
      _requestSuccessful('POST请求', response);

      // 成功回调
      if (null != success) {
        success(response.data);
      }
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);

      // 失败回调
      if (null != fail) {
        fail(e.response);
      }
    }
  }

  // PUT请求
  put(
    // 请求路径
    String path, {
    // 请求数据 - 用于流方式发送表单数据
    dynamic data,
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 请求进度回调
    ProgressCallback sendProgress,
    // 响应进度回调
    ProgressCallback receiveProgress,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.put(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancel,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      // 请求成功
      _requestSuccessful('PUT请求', response);

      // 成功回调
      if (null != success) {
        success(response.data);
      }
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);

      // 失败回调
      if (null != fail) {
        fail(e.response);
      }
    }
  }

  // DELETE请求
  delete(
    // 请求路径
    String path, {
    // 请求数据 - 用于流方式发送表单数据
    dynamic data,
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.delete(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancel,
      );
      // 请求成功
      _requestSuccessful('DELETE请求', response);

      // 成功回调
      if (null != success) {
        success(response.data);
      }
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);

      // 失败回调
      if (null != fail) {
        fail(e.response);
      }
    }
  }

// TODO:上传文件
/*
  upload(
    // 请求路径
    String path, {
    // 请求数据 - 用于流方式发送表单数据
    dynamic data,
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 请求进度回调
    ProgressCallback sendProgress,
    // 响应进度回调
    ProgressCallback receiveProgress,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.post(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancel,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      // 请求成功
      _requestSuccessful('UPLOAD', null);
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);
    }
    // 返回值
    return response.data;
  }
*/

  // 下载文件
  download(
    // 请求路径
    String path,
    // 本地保存路径
    String savePath, {
    // 请求参数
    Map<String, dynamic> query,
    // 请求配置 - 添加鉴权
    Options options,
    // 取消标识
    CancelToken cancel,
    // 下载进度回调
    ProgressCallback progress,
    // 成功回调
    Function success,
    // 失败回调
    Function fail,
  }) async {
    // 响应
    Response response;

    try {
      response = await _manager.download(
        path,
        savePath,
        options: options,
        cancelToken: cancel,
        // 下载错误, 删除文件 - 与断点续传有关?
        deleteOnError: true,
        queryParameters: query,
        onReceiveProgress: progress,
        // 默认返回 -1
        lengthHeader: Headers.contentLengthHeader,
      );
      // 请求成功
      _requestSuccessful('DOWNLOAD', null);

      // 成功回调
      if (null != success) {
        success(response.data);
      }
    } on DioError catch (e) {
      // 请求失败
      _requestFailed(e);

      // 失败回调
      if (null != fail) {
        fail(e.response);
      }
    }
  }

  // 取消请求
  void cancel(CancelToken token) {
    token.cancel('cancelled');
  }

  // 请求成功
  void _requestSuccessful(String method, Response response) {
    // 请求方式
    print('$method成功');

    if (null != response) {
      // HTTP/HTTPS状态码
      print('HTTP/HTTPS状态码:${response.statusCode}');
      // HTTP/HTTPS状态信息
      print('HTTP/HTTPS状态信息:${response.statusMessage}');

      // 服务器状态码
      var code = response.data['code'];
      print('服务器状态码:$code');
      // 服务器状态信息
      var message = response.data['msg'];
      print('服务器状态信息:$message');
      // 服务器返回数据
      var data = response.data['data'];
      print('服务器返回数据:$data');
    }
  }

  // 请求失败
  void _requestFailed(DioError error) {
    // 请求地址
    String uri = error.request.uri.toString();
    // 错误信息
    String message = error.error.toString();

    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        print('连接超时, 请求地址:$uri');
        break;
      case DioErrorType.SEND_TIMEOUT:
        print('请求超时, 请求地址:$uri');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        print('响应超时, 请求地址:$uri');
        break;
      case DioErrorType.RESPONSE:
        print('异常错误(401/404/503), 请求地址:$uri, 错误信息:$message, ${error.response}');
        break;
      case DioErrorType.CANCEL:
        print('取消请求, 请求地址:$uri');
        break;
      case DioErrorType.DEFAULT:
        print('未知错误, 请求地址:$uri, 错误信息:$message, ${error.response}');
        break;
    }
  }
}
